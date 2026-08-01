class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.235058.e658ee6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-235058-e658ee6/sideshow-darwin-arm64"
    sha256 "47639564b3f77c6b40fb03a2c3cb92df8be416a08237e247dc97c40701e65692"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-235058-e658ee6/sideshow-darwin-amd64"
    sha256 "3a3be1d01350dfd4c53585a3512d8a85a8ac04ecb1cb31adde204d6006f466fc"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-235058-e658ee6/sideshow-linux-amd64"
    sha256 "a306984b8de52b9b7e6b52cbafc92f646651b184f38f55e65a78005241993c97"
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
