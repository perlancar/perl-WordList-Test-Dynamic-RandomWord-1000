package WordList::Test::Dynamic::RandomWord::1000;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;

use WordList;
our @ISA = qw(WordList);

use Role::Tiny::With;
with 'WordListRole::EachFromFirstNextReset';

our $DYNAMIC = 2;
our $SORT = 'random';

our %PARAMS = (
    min_len => {
        schema => 'uint*',
        default => 5,
    },
    max_len => {
        schema => 'uint*',
        default => 8,
    },
);

our @EXAMPLES = (
    {
        summary => '1000 random words, each 5-8 characters long (the default length range)',
        args => {},
    },
    {
        summary => '1000 random words, each 10-15 characters long',
        args => {min_len=>10, max_len=>15},
    },
);

sub reset_iterator {
    my $self = shift;
    $self->{_iterator_idx} = 0;
}

sub first_word {
    my $self = shift;
    $self->reset_iterator;
    $self->next_word;
}

my @letters = "a".."z";
sub next_word {
    my $self = shift;
    my $min_len = $self->{params}{min_len} // 5;
    my $max_len = $self->{params}{max_len} // 8;
    return undef if $self->{_iterator_idx}++ >= 1000;
    join("", map { $letters[rand @letters] }
             1..int(($max_len-$min_len+1)*rand)+$min_len);
}

# STATS

1;
# ABSTRACT: 1000 random words

=head1 DESCRIPTION

This wordlist demoes a dynamic, non-deterministic wordlist.
