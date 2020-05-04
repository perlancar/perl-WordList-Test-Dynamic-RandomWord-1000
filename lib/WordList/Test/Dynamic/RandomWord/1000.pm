package WordList::Test::Dynamic::RandomWord::1000;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;

use WordList;
our @ISA = qw(WordList);

use Role::Tiny::With;
with 'WordListRole::EachFromFirstNextReset';

our $DYNAMIC = 2;

sub reset_iterator {
    my $self = shift;
    $self->[0] = 0;
}

sub first_word {
    my $self = shift;
    $self->reset_iterator;
    $self->next_word;
}

my @letters = "a".."z";
sub next_word {
    my $self = shift;
    return undef if $self->[0]++ >= 1000;
    join("", map { $letters[rand @letters] } 1..int(5*rand)+3);
}

# STATS

1;
# ABSTRACT: 1000 random words

=head1 DESCRIPTION

This wordlist demoes a dynamic, non-deterministic wordlist.
