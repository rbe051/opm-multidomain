// -*- mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
// vi: set et ts=4 sw=4 sts=4:
/*
  This file is part of the Open Porous Media project (OPM).

  OPM is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 2 of the License, or
  (at your option) any later version.

  OPM is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with OPM.  If not, see <http://www.gnu.org/licenses/>.

  Consult the COPYING file in the top-level source directory of this
  module for the precise wording of the license and the list of
  copyright holders.
*/
/*!
 * \file
 *
 * \brief Test for the immisicible VCVF discretization with only a single phase
 */
#include "config.h"
#include "problems/benchmark3dproblem1.hh"

#include <opm/models/immiscible/immisciblemodel.hh>
#include <opm/multidomain/utils/start.hh>


const auto FILE_NAME3D = "./data/benchmark_3d_case_1_3.txt";
const auto FILE_NAME2D = "./data/benchmark_3d_case_1_2.txt";
const auto FILE_NAME1D = "";
const auto FILE_NAME0D = "";

const auto FILE_NAME_MORTAR2D = "./data/benchmark_3d_case_1_mortar_2.txt";
const auto FILE_NAME_MORTAR1D = "";
const auto FILE_NAME_MORTAR0D = "";

const auto FILE_NAME_MAPPING3D2D = "./data/benchmark_3d_case_1_mapping_2.txt";
const auto FILE_NAME_MAPPING2D1D = "";
const auto FILE_NAME_MAPPING1D0D = "";

BEGIN_PROPERTIES
NEW_TYPE_TAG(BenchmarkProblem, INHERITS_FROM(ImmiscibleTwoPhaseModel, Benchmark3d1Problem));
END_PROPERTIES

#include "benchmark3d.hh"

BEGIN_PROPERTIES
SET_SCALAR_PROP(MultiDimModel, EndTime, 1e9 /* 31.7 years*/);
SET_SCALAR_PROP(MultiDimModel, InitialTimeStepSize, 1e9 / 100);
SET_PROP(MultiDimModel, SubTypeTag)
{
    typedef TTAG(Domain3d) Domain0Type;
    typedef TTAG(Domain2d) Domain1Type;

public:
    typedef Opm::MultiDomainProperties<Domain0Type, Domain1Type> type;
};

SET_PROP(MultiDimModel, CouplerTypeTag)
{
    typedef TTAG(Coupler32) Coupler0;

public:
    typedef Opm::MultiCouplerProperties<Coupler0> type;
};

END_PROPERTIES


int main(int argc, char **argv)
{
    typedef TTAG(MultiDimModel) MixedDimModelTypeTag;
    start<MixedDimModelTypeTag>(argc, argv);
}