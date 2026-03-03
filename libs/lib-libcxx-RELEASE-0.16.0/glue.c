/*
 *      Unikraft port of C++ standard library.
 *      Copyright(C) 2019 Vlad-Andrei Badoiu, University Politehnica
 *      of Bucharest
 *
 *      This library is free software; you can redistribute it and/or
 *      modify it under the terms of the GNU Lesser General Public
 *      License as published by the Free Software Foundation; either
 *      version 2 of the License, or (at your option) any later version.
 *
 *      This library is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *      Lesser General Public License for more details.
 *
 *      You should have received a copy of the GNU Lesser General Public
 *      License along with this library in the file COPYING.LIB;
 *      if not, write to the Free Software Foundation, Inc.,
 *      59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 */

#include <nl_types.h>
#include <uk/config.h>

#ifndef CONFIG_LIBMUSL
int catclose(nl_catd catalog)
{
	return 0;
}

nl_catd catopen(const char *name, int flag)
{
	return 0;
}

char *catgets(nl_catd catalog, int set_number, int message_number,
				const char *message)
{
	return 0;
}
#endif

void *__dso_handle = (void *) &__dso_handle;
