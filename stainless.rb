require 'formula'

class Leon < Formula
  homepage 'https://stainless.epfl.ch'
  url 'https://github.com/epfl-lara/stainless.git', :revision => "9adcdf8ea99766062f511666c0829b4c316bc977"
  version '0.1'

  depends_on 'sbt'
  depends_on 'z3'

  def install
    scala_version = `#{HOMEBREW_PREFIX}/bin/scala -version 2>&1 | awk '{print $5}' | cut -d "." -f 1 -f 2`
    scala_version = scala_version.strip

    (lib/"stainless").install "library"
    inreplace "build.sbt", 'baseDirectory.value / "library"', "file(\"#{lib}/stainless\") / \"library\""

    system "sbt clean compile"

    (lib/"stainless/target/scala-#{scala_version}").install ("target/scala-#{scala_version}/classes")
    (lib/'stainless/src/main').install ("src/main/resources")
    (lib/'stainless/unmanaged/64').install Dir["unmanaged/64/*.jar"], Dir["unmanaged/common/*.jar"]
    inreplace 'stainless', "#{buildpath}", "#{lib}/stainless"
    bin.install 'stainless'
  end
end
