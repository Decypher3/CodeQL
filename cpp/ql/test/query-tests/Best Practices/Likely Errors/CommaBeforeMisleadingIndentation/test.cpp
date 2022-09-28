// clang-format off

typedef unsigned size_t;

struct X {
	int foo(int y) { return y; }
} x;

#define FOO(x) ( \
   (x),          \
  (x)            \
)

#define BAR(x, y) ((x), (y))

int test(int i, int j, int (*foo)(int), int (*bar)(int, int))
{
	// Comma in simple if statement (prototypical example):

	if (i)
		(void)i,	// GOOD
		(void)j;

	if (i)
		(void)i,	// BAD
	(void)j;

	// Parenthesized comma (borderline example):

	foo(i++), j++;   // GOOD
	(foo(i++), j++); // GOOD
	(foo(i++),       // GOOD
	 j++);
	(foo(i++),
	j++);            // BAD (?)

	x.foo(i++), j++;   // GOOD
	(x.foo(i++), j++); // GOOD
	(x.foo(i++),       // GOOD
	 j++);
	(x.foo(i++),
	j++);              // BAD (?)

	FOO(i++), j++;   // GOOD
	(FOO(i++), j++); // GOOD
	(FOO(i++),       // GOOD
	 j++);
	(FOO(i++),
	j++);            // BAD (?)

	(void)(i++), j++;   // GOOD
	((void)(i++), j++); // GOOD
	((void)(i++),       // GOOD
	 j++);
	((void)(i++),
	j++);               // BAD (?)

	// Comma in argument list doesn't count:

	bar(i++, j++); // GOOD
	bar(i++,
	    j++);      // GOOD
	bar(i++
	  , j++);      // GOOD
	bar(i++,
	j++);          // GOOD: common pattern and unlikely to be misread.

	BAR(i++, j++); // GOOD
	BAR(i++,
	    j++);      // GOOD
	BAR(i++
	  , j++);      // GOOD
	BAR(i++,
	j++);          // GOOD: common pattern and unlikely to be misread.

	using T = decltype(x.foo(i++), // GOOD
	                   j++);
	(void)sizeof(x.foo(i++), // GOOD
	             j++);
	using U = decltype(x.foo(i++), // GOOD? Unlikely to be misread
				j++);
	(void)sizeof(x.foo(i++), // GOOD? Unlikely to be misread
				j++);

	// Comma in loops

    while (i = foo(j++), // GOOD
           i != j && i != 42 &&
               !foo(j)) {
        i = j = i + j;
    }

    while (i = foo(j++), // GOOD??? Currently ignoring loop heads
        i != j && i != 42 && !foo(j)) {
        i = j = i + j;
    }

	for (i = 0,         // GOOD? Currently ignoring loop heads.
	    j = 1;
		i + j < 10;
		i++, j++);

	for (i = 0,
         j = 1; i < 10; i += 2, // GOOD? Currently ignoring loop heads.
        j++) {}

    // Mixed tabs and spaces (ugly case):

    for (i = 0,         // GOOD if tab >= 4 spaces else BAD -- can't exclude w/o source code text :/
		 j = 0;
		 i + j < 10;
         i++,           // GOOD if tab >= 4 spaces else BAD -- can't exclude w/o source code text :/
		 j++);

	if (i)
	    (void)i,	    // GOOD if tab >= 4 spaces else BAD -- can't exclude w/o source code text :/
		(void)j;

	// LHS ends on same line RHS begins on:

	int k = (foo(
		i++
	), j++); // GOOD?

	// Weird case:

	if (foo(j))
		return i++
			, i++ // GOOD(?) [FALSE POSITIVE] -- can't exclude w/o source code text :/
			? 1
			: 2;

	return 0;
}

// Comma in variadic template splice:

namespace std {
	template <size_t... Is>
	struct index_sequence {};
}

template <size_t I>
struct zip_index {};

template <size_t I>
int& at(zip_index<I>) { throw 1; }

template <class Fn, class At, size_t... Is>
void for_each_input(Fn&& fn, std::index_sequence<Is...>) {
	(fn(zip_index<Is>{}, at(zip_index<Is>{})), ...); // GOOD
}

// clang-format on
