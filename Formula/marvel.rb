class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.014042.b04a002"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014042-b04a002/marvel-darwin-arm64"
    sha256 "7ba3c3d0f469f9d9e2bb315df64d7301ad74ad2e45260c39c82dc42da71fe062"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014042-b04a002/marvel-darwin-amd64"
    sha256 "6c381c2341695724de421ef3f6c77c57ee675ba5d7ee1ec5cd266db66b6fd043"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014042-b04a002/marvel-linux-arm64"
    sha256 "986e0324c1ff36d22b673ab38f01c651341a1753db40602f52e1392094140860"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-014042-b04a002/marvel-linux-amd64"
    sha256 "738e333ea5875f031bca10c9ff27364dbc25d8d025357a508af19ca6a5be226e"
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
