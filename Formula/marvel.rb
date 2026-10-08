class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.193624.833f692"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193624-833f692/marvel-darwin-arm64"
    sha256 "2ab4fa3efa3e4fdcb264bdf04f035ee567783d7a18bea34cc67aa4a468890be8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193624-833f692/marvel-darwin-amd64"
    sha256 "e5c7c3f45a9ec43e4da6b07565450056d8bd52df530c28682b1cecf18a8e9c80"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193624-833f692/marvel-linux-arm64"
    sha256 "c740962b49d3680a0ec64bdee057dc7c05685fabfd5177ab7c8aff536df1b5db"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193624-833f692/marvel-linux-amd64"
    sha256 "ca2a5d01a2fa1d8245686a56633fd3ce212ca73529e1bcbe0959ac419dd58869"
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
