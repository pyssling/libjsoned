#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "declaration.h"
#include "struct_parser.h"

struct declaration *new_declaration(int type, char *name)
{
	struct declaration *decl;

	decl = malloc(sizeof(*decl));
	if (!decl) {
		perror("Failed to allocate for new declaration");
		exit(EXIT_FAILURE);
	}

	memset(decl, 0, sizeof(*decl));

	decl->type = type;
	decl->name = strdup(name);
	if (!decl->name) {
		perror("Failed to duplicate declaration name");
		exit(EXIT_FAILURE);
	}

	return decl;
}
