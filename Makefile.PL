
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.017.
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "vendor plugin for 2market",
  "AUTHOR" => "Adam Stokes <adamjs\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Market-Plugin-Vendor",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Market::Plugin::Vendor",
  "PREREQ_PM" => {
    "Mojo::Base" => 0,
    "Mojo::Util" => 0
  },
  "TEST_REQUIRES" => {
    "Mojolicious" => 0,
    "Pod::Elemental::Transformer::List" => 0,
    "Pod::Weaver::Section::WarrantyDisclaimer" => 0,
    "Test::Mojo" => 0,
    "Test::More" => 0,
    "Test::NoTabs" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Mojo::Base" => 0,
  "Mojo::Util" => 0,
  "Mojolicious" => 0,
  "Pod::Elemental::Transformer::List" => 0,
  "Pod::Weaver::Section::WarrantyDisclaimer" => 0,
  "Test::Mojo" => 0,
  "Test::More" => 0,
  "Test::NoTabs" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



