class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.220342.7c981e6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-220342-7c981e6/marvel-darwin-arm64"
    sha256 "036ee07830b937e1dc3fedd99fe388a1f1747ee4fb2d45a96117cc8d1e82cf02"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-220342-7c981e6/marvel-darwin-amd64"
    sha256 "63ee53c40c81be49070f4528e33e52e0562ce328d11ab1a662f7132fbc1b5bd5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-220342-7c981e6/marvel-linux-arm64"
    sha256 "5f0b6db6ef4050e31e6634b1f64c9c3f5f9ee416db0aeeb5619802479f80718f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-220342-7c981e6/marvel-linux-amd64"
    sha256 "174f60c606624a4b02f2f190c9841f49f6c03d913c8c2aa697075fb4227198f9"
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
