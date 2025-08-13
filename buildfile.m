function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;
plan("test") = TestTask;

plan.DefaultTasks = ["check" "test"];
end

function standaloneTask(ctx)
projectRoot = ctx.Plan.Project.RootFolder;

% Create target build options object, set build properties and build.
buildOpts = compiler.build.StandaloneApplicationOptions(fullfile(projectRoot, "src", "hello.m"));
buildOpts.AutoDetectDataFiles = true;
buildOpts.OutputDir = fullfile(projectRoot, "derived", "build");
buildOpts.ObfuscateArchive = false;
buildOpts.Verbose = true;
buildOpts.EmbedArchive = true;
buildOpts.ExecutableName = "hello";
buildOpts.ExecutableVersion = "1.0.0";
buildOpts.TreatInputsAsNumeric = false;
buildResult = compiler.build.standaloneApplication(buildOpts);


% Create package options object, set package properties and package.
packageOpts = compiler.package.InstallerOptions(buildResult);
packageOpts.ApplicationName = "Hello App";
packageOpts.AuthorName = "Sam Eagen";
packageOpts.OutputDir = fullfile(projectRoot, "derived", "package");
packageOpts.Summary = "App for greeting";
packageOpts.Verbose = true;
compiler.package.installer(buildResult, "Options", packageOpts);
end