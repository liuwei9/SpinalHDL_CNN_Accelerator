name := "project"

version := "0.1"

scalaVersion := "2.11.12"

libraryDependencies ++= Seq(
    "com.github.spinalhdl" % "spinalhdl-core_2.11" % "latest.release",
    "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "latest.release",
    compilerPlugin("com.github.spinalhdl" % "spinalhdl-idsl-plugin_2.11" % "latest.release")
)