class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.144837.8cff5e8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144837-8cff5e8/marvel-darwin-arm64"
    sha256 "a1ad2335cdebbe3e949284168bb0769ff65fcca52293e18f72ec8402a158c5cd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144837-8cff5e8/marvel-darwin-amd64"
    sha256 "45c66e1ee9e7a730e16455e0e982c5ed2fd4d6554f0b218365b75df0f9f164c6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144837-8cff5e8/marvel-linux-arm64"
    sha256 "5e62268698dd5e9a4a94147a218c3b9a942a4d9368d0c69f18de27f8ac374f4f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144837-8cff5e8/marvel-linux-amd64"
    sha256 "1318d4c241d814a7a62fe747eea3dcd8fe50cdaef039e59ba89527af8c33a27c"
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
