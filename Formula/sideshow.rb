class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261004.181713.0346b11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261004-181713-0346b11/sideshow-darwin-arm64"
    sha256 "c44e3f1d83befde48eed79bfed49baca8fba0f275df4674d48c1d70ad2ad3c89"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261004-181713-0346b11/sideshow-darwin-amd64"
    sha256 "7044aa2289285c66e54795cf2424a82604cd04dbc857b1b448859ed3c22063f2"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261004-181713-0346b11/sideshow-linux-amd64"
    sha256 "15e36ff765398aa12a29217b43973732e1c2448cff935da774103c5fee8af86d"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
