class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261128.034025.5bfef5f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-034025-5bfef5f/marvel-darwin-arm64"
    sha256 "c52f6316ee4dd2bed2ee42628f19742a2ba542c7380cc19c6f10a6a88ca0507d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-034025-5bfef5f/marvel-darwin-amd64"
    sha256 "df1b74bb950427ca2478d27c239b910546cecb0b6e0bca5f0e55d31eebbb0e63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-034025-5bfef5f/marvel-linux-arm64"
    sha256 "6e6b3a4ec8034948d34915c5a52e1ddf4a23d43659e4c7b587f6024e9f3fc9ad"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-034025-5bfef5f/marvel-linux-amd64"
    sha256 "a8a35f6a7ff6b4d69ad85470e3ce7f07a0c00736c99207e1a792032b40c84abf"
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
