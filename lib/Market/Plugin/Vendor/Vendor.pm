package Market::Plugin::Vendor::Vendor;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::Util qw(hmac_sha1_sum);

sub index {
  my $self  =shift;
  $self->stash(vendor => $self->get_vendor);
  $self->render('/vendor/manage/index');
}

sub login {
  my $self = shift;
  $self->render('/vendor/login');
}

sub verify {
    my $self = shift;
    my $vendor = $self->db->namespace('vendors')
      ->find_one({username => $self->param('username')});
    my $entered_pass =
      hmac_sha1_sum($self->app->secrets->[0], $self->param('password'));
    if ($entered_pass eq $vendor->{password}) {
        $self->flash(success => 'Youre authenticated!');
        $self->session(username => $vendor->{username});
        $self->session(domain => $vendor->{slug});
        $self->redirect_to('vendor_manage_index');
    }
    else {
        $self->flash(
            danger => 'Incorrect password/username, please try again.');
        $self->redirect_to('vendor_login');
    }
}

1;

__END__
