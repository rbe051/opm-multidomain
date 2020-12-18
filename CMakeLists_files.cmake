# -*- mode: cmake; tab-width: 2; indent-tabs-mode: t; truncate-lines: t; compile-command: "cmake -Wdev" -*-
# vim: set filetype=cmake autoindent tabstop=2 shiftwidth=2 noexpandtab softtabstop=2 nowrap:

# This file sets up five lists:
#	MAIN_SOURCE_FILES     List of compilation units which will be included in
#	                      the library. If it isn't on this list, it won't be
#	                      part of the library. Please try to keep it sorted to
#	                      maintain sanity.
#
#	TEST_SOURCE_FILES     List of programs that will be run as unit tests.
#
#	TEST_DATA_FILES       Files from the source three that should be made
#	                      available in the corresponding location in the build
#	                      tree in order to run tests there.
#
#	EXAMPLE_SOURCE_FILES  Other programs that will be compiled as part of the
#	                      build, but which is not part of the library nor is
#	                      run as tests.
#
#	PUBLIC_HEADER_FILES   List of public header files that should be
#	                      distributed together with the library. The source
#	                      files can of course include other files than these;
#	                      you should only add to this list if the *user* of
#	                      the library needs it.
#
# ATTIC_FILES           Unmaintained files. This for the projects developers
#                       only. Don't expect these files to build.

# originally generated with the command:
# find opm -name '*.c*' -printf '\t%p\n' | sort
#list(APPEND MAIN_SOURCE_FILES "")

# originally generated with the command:
# find tests -name '*.cpp' -a ! -wholename '*/not-unit/*' -printf '\t%p\n' | sort
#list(APPEND TEST_SOURCE_FILES "")

# originally generated with the command:
# find tests -name '*.xml' -a ! -wholename '*/not-unit/*' -printf '\t%p\n' | sort
file(GLOB_RECURSE TMP_GRIDS RELATIVE "${PROJECT_SOURCE_DIR}" "tests/*.dgf")
file(GLOB_RECURSE TMP_PP_GRIDS RELATIVE "${PROJECT_SOURCE_DIR}" "tests/*.txt")
file(GLOB_RECURSE TMP_VTUS RELATIVE "${PROJECT_SOURCE_DIR}" "*tests/*.vtu")
file(GLOB_RECURSE TMP_VTPS RELATIVE "${PROJECT_SOURCE_DIR}" "tests/*.vtp")

list(APPEND TEST_DATA_FILES
	${TMP_PP_GRIDS}
	${TMP_GRIDS}
	${TMP_VTPS}
	${TMP_VTUS}
	)

list(APPEND TEST_SOURCE_FILES)

list(APPEND TEST_SOURCE_FILES)

# originally generated with the command:
# find tutorials examples -name '*.c*' -printf '\t%p\n' | sort
list(APPEND EXAMPLE_SOURCE_FILES
	)

# programs listed here will not only be compiled, but also marked for
# installation
list (APPEND PROGRAM_SOURCE_FILES
	)

list (APPEND PUBLIC_HEADER_FILES
	opm/twophase/blockProblem.hh
  opm/twophase/logPc.hh
  opm/twophase/simplifiedVanGenuchten.hh
  opm/twophase/logPcParams.hh
  opm/twophase/start.hh
	opm/twophase/constantPc.hh
  opm/twophase/oilMigrationProblem.hh
  opm/twophase/twoDrainsOneBarrierProblem.hh
	opm/twophase/gravityDominantFlowProblem.hh
  opm/twophase/oilMigrationUnitProblem.hh
  opm/twophase/viscousDominantFlowProblem.hh
	opm/twophase/leftToRightProblem.hh
  opm/twophase/regularizedLogPc.hh
	opm/twophase/lensproblem.hh
  opm/twophase/regularizedLogPcParams.hh
)
