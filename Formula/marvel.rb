class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260908.225512.1003277"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-225512-1003277/marvel-darwin-arm64"
    sha256 "8a5c12af132aefd810d08f844154d234c5b749ed8a667a449e10cde256a3ce80"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-225512-1003277/marvel-darwin-amd64"
    sha256 "1b5c5204121dd81950010902ab11bb3b7f90a5cd514b3c3cbaf46622daf2e6dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-225512-1003277/marvel-linux-arm64"
    sha256 "4733c142d0aaa35775c12c41790d49410026def9ca7418fd7c01a6247c71566f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-225512-1003277/marvel-linux-amd64"
    sha256 "d1e5e07ab2112d9442fbea1238e1dbfe3d90993f38503652f93c3fadb43b46ba"
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
