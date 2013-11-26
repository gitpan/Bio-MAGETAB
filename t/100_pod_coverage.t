#!/usr/bin/env perl
#
# Copyright 2008-2010 Tim Rayner
# 
# This file is part of Bio::MAGETAB.
# 
# Bio::MAGETAB is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
# 
# Bio::MAGETAB is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Bio::MAGETAB.  If not, see <http://www.gnu.org/licenses/>.
#
# $Id: 100_pod_coverage.t 381 2013-11-04 10:55:27Z tfrayner $

use strict;
use warnings;

use Test::More;
eval "use Test::Pod::Coverage 1.00";
if ( $@ ) {
    plan skip_all => "Test::Pod::Coverage 1.00 required for testing POD coverage";
}
elsif ( ! $ENV{MAGETAB_TEST_POD_COVERAGE} ) {
    plan skip_all => 'Set $MAGETAB_TEST_POD_COVERAGE to test POD coverage. Requires Graphviz and Tangram modules.';
}

plan tests => 57;

my @fully_covered =
    qw(
          Bio::MAGETAB
          Bio::MAGETAB::ArrayDesign
          Bio::MAGETAB::Assay
          Bio::MAGETAB::BaseClass
          Bio::MAGETAB::Comment
          Bio::MAGETAB::CompositeElement
          Bio::MAGETAB::Contact
          Bio::MAGETAB::ControlledTerm
          Bio::MAGETAB::Data
          Bio::MAGETAB::DataAcquisition
          Bio::MAGETAB::DatabaseEntry
          Bio::MAGETAB::DataFile
          Bio::MAGETAB::DataMatrix
          Bio::MAGETAB::DesignElement
          Bio::MAGETAB::Edge
          Bio::MAGETAB::Event
          Bio::MAGETAB::Extract
          Bio::MAGETAB::Factor
          Bio::MAGETAB::FactorValue
          Bio::MAGETAB::Feature
          Bio::MAGETAB::Investigation
          Bio::MAGETAB::LabeledExtract
          Bio::MAGETAB::Material
          Bio::MAGETAB::MatrixColumn
          Bio::MAGETAB::MatrixRow
          Bio::MAGETAB::Measurement
          Bio::MAGETAB::Node
          Bio::MAGETAB::Normalization
          Bio::MAGETAB::ParameterValue
          Bio::MAGETAB::Protocol
          Bio::MAGETAB::ProtocolApplication
          Bio::MAGETAB::ProtocolParameter
          Bio::MAGETAB::Publication
          Bio::MAGETAB::Reporter
          Bio::MAGETAB::Sample
          Bio::MAGETAB::SDRF
          Bio::MAGETAB::SDRFRow
          Bio::MAGETAB::Source
          Bio::MAGETAB::TermSource
          Bio::MAGETAB::Types
          Bio::MAGETAB::Util::DBLoader
          Bio::MAGETAB::Util::Persistence
          Bio::MAGETAB::Util::Reader
          Bio::MAGETAB::Util::Reader::ADF
          Bio::MAGETAB::Util::Reader::DataMatrix
          Bio::MAGETAB::Util::Reader::IDF
          Bio::MAGETAB::Util::Reader::SDRF
          Bio::MAGETAB::Util::Reader::Tabfile
          Bio::MAGETAB::Util::Reader::TagValueFile
          Bio::MAGETAB::Util::Writer
          Bio::MAGETAB::Util::Writer::Tabfile
          Bio::MAGETAB::Util::Writer::GraphViz
          Bio::MAGETAB::Util::Writer::ADF
          Bio::MAGETAB::Util::Writer::IDF
          Bio::MAGETAB::Util::Writer::SDRF
          Bio::MAGETAB::Util::RewriteAE
  );

pod_coverage_ok(
    $_,
    { also_private => [ qr/^BUILD$/ ] },
) for @fully_covered;

# Builder is a special case; these methods are documented, but not in
# the way Test::Pod::Coverage would like. Personally I think my way's
# clearer for large numbers of autogenerated methods. Is this a big
# old cheat? You betcha.
pod_coverage_ok(
    'Bio::MAGETAB::Util::Builder',
    { also_private => [ qr/^BUILD$/ ],
      trustme      => [ qr/^get_/, qr/^create_/, qr/^find_or_create_/ ] },
);                

