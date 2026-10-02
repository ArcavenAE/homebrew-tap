class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.222746.2443259"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222746-2443259/marvel-darwin-arm64"
    sha256 "5f75cea4b581a8bd7dda56541b342d7e9d31a14e48b226abb62eaa31428410ea"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222746-2443259/marvel-darwin-amd64"
    sha256 "f926e8b99bb490e8c4b4ff5641b1d8cbdb341c275bb8a158d6f95c60c4adefcb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222746-2443259/marvel-linux-arm64"
    sha256 "0e14e3d4070f2019a760f0d712dfa375da45e92da1855c4aab365c91ff632b18"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222746-2443259/marvel-linux-amd64"
    sha256 "1ba14434b9312a75318f94e062e3ad03cc75fd8273166e00693b873cd58f9fd6"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
