package Market::Plugin::Vendor;

# ABSTRACT: vendor plugin for 2market

use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app) = @_;

    push @{$app->routes->namespaces}, 'Market::Plugin::Manager';
    $app->helper(
        get_vendor => sub {
            my $self        = shift;
            my $vendor_user = $self->db->namespace('vendors')
              ->find_one({username => $self->session->{username}});
        }
    );
    my $vendor = $app->routes->under(
        sub {
            my $self = shift;
            return $self->auth_role_fail unless $self->session->{username};
            return $self->auth_role_fail unless $self->get_vendor;
        }
    );

    $app->routes->any('/explore')->to('explore#index')->name('explore_index');
    $app->routes->any('/explore/:vendor')->to('explore#vendor')
      ->name('explore_vendor');
    $app->routes->any('/shop/:vendor')->to('shop#index')->name('shop_index');
    $app->routes->any('/shop/:vendor/:product')->to('shop#detail')
      ->name('shop_detail');
}

1;
