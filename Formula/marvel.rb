class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.191012.c75a05b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-191012-c75a05b/marvel-darwin-arm64"
    sha256 "a22c8034d83ea64ee48dfbfc68b17666dcf2f9c773dba0bbfd1b0ad4ecb51dfa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-191012-c75a05b/marvel-darwin-amd64"
    sha256 "86cb2b4bd9cf368dc2e823b523f2125774666de497cad4266cbf8194e744cb2a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-191012-c75a05b/marvel-linux-arm64"
    sha256 "2e7d5a4ed04825ebcc2dcc7bddb4a7cb01e1ea4c5406ed15786db67d8c5875d7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-191012-c75a05b/marvel-linux-amd64"
    sha256 "8e36587c42df0eb22f68b211d63102cc46129b44191f8808063815260c924306"
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
