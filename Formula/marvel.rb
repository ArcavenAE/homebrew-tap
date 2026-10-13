class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261013.231216.0e6dd4d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-231216-0e6dd4d/marvel-darwin-arm64"
    sha256 "d16646b1980ac2f1e5306a42b060cf05704e1f4c4a85d082d5e1365e0faf54f8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-231216-0e6dd4d/marvel-darwin-amd64"
    sha256 "ebf17051535bb14060aea93425ef3575fe85bf89cfedb3e910302bb278ee9dc9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-231216-0e6dd4d/marvel-linux-arm64"
    sha256 "6f0ae34b68f8bfbdc1e4ccdf2596d6356c6a08b7929bcaf24d18353957ace1d3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-231216-0e6dd4d/marvel-linux-amd64"
    sha256 "b74c9eec5126ae00f0329cab39134299c7beaf33aff37a1eb71e77464227dae9"
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
