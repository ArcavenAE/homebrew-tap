class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261026.230324.260f77a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-230324-260f77a/marvel-darwin-arm64"
    sha256 "804fd6270fe83a6a6251803a39d58699d687619ebe4b91269f46b62d01e60d97"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-230324-260f77a/marvel-darwin-amd64"
    sha256 "7e04fb4b4395e37ae4d610c648ff8f405a9d1071ad82bd0deb7106571eb3896e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-230324-260f77a/marvel-linux-arm64"
    sha256 "d8d7347a38759b5f85f51f2348621513ca7464c5891a5bf21906dbe3c63f83de"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261026-230324-260f77a/marvel-linux-amd64"
    sha256 "f3215cfbc2cf7fdaf52aea4bff71e0aabff4627a91a600ea0c77cd45ebecef78"
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
