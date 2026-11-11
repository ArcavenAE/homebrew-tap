class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261111.153737.9a79734"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-153737-9a79734/marvel-darwin-arm64"
    sha256 "e91051d97a29f0b50453fb08b0974598ef68a18c8948512e7bd9aed0eb71b21f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-153737-9a79734/marvel-darwin-amd64"
    sha256 "b383f189e11977ab31ec70f9d7de64026bca04c8ac10b2fde99d91113e1bebc4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-153737-9a79734/marvel-linux-arm64"
    sha256 "6e4364a2a4c6a96e35af855b324cfefe81a7fe6392cbb112a9aea71e1233c100"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-153737-9a79734/marvel-linux-amd64"
    sha256 "80ae9496c059afe8a9c7611ca6c55d058622607a053c6335ef5089480bd0a820"
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
