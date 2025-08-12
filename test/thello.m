classdef thello < matlab.unittest.TestCase
    methods (Test)
        function mattTest(testCase)
            out = string(getGreeting("Matt"));
            testCase.verifyEqual(out, "Hello Matt!");
        end

        function nathanTest(testCase)
            out = string(getGreeting("Nathan"));
            testCase.verifyEqual(out, "Hello Nathan!");
        end

        function ciaraTest(testCase)
            out = string(getGreeting("Ciara"));
            testCase.verifyEqual(out, "Hello Ciara!");
        end

        function aliciaTest(testCase)
            out = string(getGreeting("Alicia"));
            testCase.verifyEqual(out, "Hello Alicia!");
        end

        function toddTest(testCase)
            out = string(getGreeting("Todd"));
            testCase.verifyEqual(out, "Hello Todd!");
        end

        function markTest(testCase)
            out = string(getGreeting("Mark"));
            testCase.verifyEqual(out, "Hello Mark!");
        end

        function andyTest(testCase)
            out = string(getGreeting("Andy"));
            testCase.verifyEqual(out, "Hello Andy!");
        end
    end
end

function out = getGreeting(name)
out = strtrim(evalc(sprintf("hello('%s')", name)));
end
