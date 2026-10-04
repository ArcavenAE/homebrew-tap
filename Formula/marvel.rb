class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.231911.94b4b07"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-231911-94b4b07/marvel-darwin-arm64"
    sha256 "27fd72a4646e7ab380d68bc7a8774f1b3058e44c1359e50d539e743b2008f86e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-231911-94b4b07/marvel-darwin-amd64"
    sha256 "b85d02217ef57d42ab2d45f2d67adce966d87905e5cc0049ff200c6ea7148a4c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-231911-94b4b07/marvel-linux-arm64"
    sha256 "0f6499b265954a0651b50facb495dedae8604b6e3e467298a1ff54ab839cbf34"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-231911-94b4b07/marvel-linux-amd64"
    sha256 "9bffb69d23fb3aaf701a883ab952f4687a6497930ea332392dcb572d52efc5ce"
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
