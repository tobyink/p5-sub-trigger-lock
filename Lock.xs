#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "const-c.inc"

MODULE = Sub::Trigger::Lock		PACKAGE = Sub::Trigger::Lock

INCLUDE: const-xs.inc

void
_lock (obj, ref, ...)
	SV* obj
	SV* ref
PPCODE:
{
	if (!SvROK(ref))
		XSRETURN_NO;	
	SvREADONLY_on( SvRV(ref) );
	XSRETURN_YES;
}
