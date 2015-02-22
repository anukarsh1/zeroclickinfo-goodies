#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => "coffee_to_water_ratio";
zci is_cached   => 1;

ddg_goodie_test(
    [qw( DDG::Goodie::CoffeeToWaterRatio )],

	'30g coffee to water' => test_zci("501 ml of water",
        structured_answer => { 
            input       => ['30 g'],                                                                                                                                                                                                                                                                                    
            operation   => "Water calculation for metric coffee weight",                                                                                                                                                                                                                                                          
            result      => "501 ml of water"
        }		
	),
	'coffee to water 30G' => test_zci("501 ml of water",
        structured_answer => { 
            input       => ['30 G'],                                                                                                                                                                                                                                                                                    
            operation   => "Water calculation for metric coffee weight",                                                                                                                                                                                                                                                          
            result      => "501 ml of water"
        }
    ),
	'coffee to water ratio 1 ounce' => test_zci("16 fl. oz. of water",
        structured_answer => { 
            input       => ['1 ounce'],                                                                                                                                                                                                                                                                                    
            operation   => "Water calculation for imperial coffee weight",                                                                                                                                                                                                                                                          
            result      => "16 fl. oz. of water"
        }
	),
	'31.2 grams coffee to water ratio' => test_zci("521 ml of water",
        structured_answer => { 
            input       => ['31.2 grams'],                                                                                                                                                                                                                                                                                    
            operation   => "Water calculation for metric coffee weight",                                                                                                                                                                                                                                                          
            result      => "521 ml of water"
        }
	),
	'coffee to water .5Oz' => test_zci("8 fl. oz. of water",
        structured_answer => { 
            input       => ['.5 Oz'],                                                                                                                                                                                                                                                                                    
            operation   => "Water calculation for imperial coffee weight",                                                                                                                                                                                                                                                          
            result      => "8 fl. oz. of water"
        }
	),
	'COFFEE TO WATER' => test_zci("1 g to 16.7 ml (0.035 oz. to 0.56 fl. oz.)",
        structured_answer => { 
            input       => undef,                                                                                                                                                                                                                                                                                    
            operation   => "Coffee to water ratio per gram (0.035 ounces)",                                                                                                                                                                                                                                                          
            result      => "16.7 ml (0.56 fl. oz.)"
        }
	),
	'coffee to water ratio' => test_zci("1 g to 16.7 ml (0.035 oz. to 0.56 fl. oz.)",
        structured_answer => { 
            input       => undef,                                                                                                                                                                                                                                                                                    
            operation   => "Coffee to water ratio per gram (0.035 ounces)",                                                                                                                                                                                                                                                          
            result      => "16.7 ml (0.56 fl. oz.)"
        }
	),
    'bad example query' => undef,
    'coffee to water 20 rgams' => undef,
    'coffee to water 20 garms' => undef,
);

done_testing;