# $Id: Makefile.PL,v 1.2 2002/12/11 22:48:15 comdog Exp $
use ExtUtils::MakeMaker;

sub ExtUtils::MM_Any::test_via_harness
	{
    my($self, $perl, $tests) = @_;

    return qq|\t$perl "-MTest::Manifest" | .
           qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
           qq|'\$(INST_ARCHLIB)')"\n|;
	}

WriteMakefile(
    'NAME'		    => 'journals',
	'VERSION'       => '0.7',
	
	'EXE_FILES' =>  [ 'journals' ],
	    	
	'PREREQ_PM' => {
		'File::Find::Rule'  => '0',
		'SOAP::Lite'        => '0',
		'Test::Manifest'    => '0',
		'Test::More'        => '0',
		'Test::Pod'         => '0',
		'Text::Template'    => '0',
		},
		
	'MAN1PODS' => {
		'journals' => '$(INST_MAN1DIR)/journals.1'
		},
		
	clean => { FILES => '*.bak journals-*' }

	);
