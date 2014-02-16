#ifndef _DECLARATION_H
#define _DECLARATION_H

enum type {
	TYPE_CHAR = 0x01,
	TYPE_INT = 0x02,
	TYPE_STRUCT = 0x04
};

enum specifier {
	SPEC_SHORT = 0x08,
	SPEC_LONG = 0x10,
	SPEC_UNSIGNED = 0x20,
	SPEC_SIGNED = 0x40
};

struct declaration {
	int type;
	char *name;
	struct declaration *next;
	struct declaration *children;
};

struct declaration *new_declaration(int type, char *name);

#endif /* _DECLARATION_H */
