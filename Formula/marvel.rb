class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.213429.916a848"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-213429-916a848/marvel-darwin-arm64"
    sha256 "a7633a48d5227abdb0a65837dc64644c5ec8cb3cd307cd6d081b0a408f030130"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-213429-916a848/marvel-darwin-amd64"
    sha256 "6f0dd91a81c00dce4f2db7651cf5da18fcd96def7df501d4b05b62af2116ce86"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-213429-916a848/marvel-linux-arm64"
    sha256 "59359337691022aaed43b0eb8bdd22b483b34b11fbe13661aa21c818cc8dc5ed"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-213429-916a848/marvel-linux-amd64"
    sha256 "a878267313822bd5e281849b167a6027f2b721ebaac058beef476daf68b93d7e"
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
