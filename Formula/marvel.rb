class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.073625.cff3f90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073625-cff3f90/marvel-darwin-arm64"
    sha256 "9ba6e754e8a823ad868cbbfeafffd2fa4563df9ba21bc48317c424fb415e65bc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073625-cff3f90/marvel-darwin-amd64"
    sha256 "0c0c4b34117c40c3cf47b67dc950256c9fed01856ead7d41f04041f92f448888"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073625-cff3f90/marvel-linux-arm64"
    sha256 "ac85159546807046cd5f165939941e54a58dbb9aa3dc6642bbe64d933a9574a6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-073625-cff3f90/marvel-linux-amd64"
    sha256 "6e08523f3793e22d8f832e0e23282223b08ca8abc0bbabced72b2631a08ba357"
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
