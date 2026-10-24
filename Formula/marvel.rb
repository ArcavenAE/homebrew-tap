class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261024.201655.ac6c7b9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201655-ac6c7b9/marvel-darwin-arm64"
    sha256 "093bd2f6ff498647184e888cefa7b26607433d28acbc6aff8ce3bf250484968c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201655-ac6c7b9/marvel-darwin-amd64"
    sha256 "8357e02ad6009c68a8ffe31f8ea0dd957a5a2d2d1758b018bdb65fdaa550ae5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201655-ac6c7b9/marvel-linux-arm64"
    sha256 "840aa38f3934b05217d46a0896a38c5c371202022498ebcc0c3195f47a9c4f48"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-201655-ac6c7b9/marvel-linux-amd64"
    sha256 "da95bb56617daa914a0458ea8741640463f9d4a89d8760808a0ececafb0bf9f8"
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
