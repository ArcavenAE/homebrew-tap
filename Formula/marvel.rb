class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.031247.814df0a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031247-814df0a/marvel-darwin-arm64"
    sha256 "1bd904c4bb00f853f83a6cebc79d51a759d86839a67dbe6efa9796f1c7ead234"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031247-814df0a/marvel-darwin-amd64"
    sha256 "7a3f8402745a2fdd67551be9025ae993803c248216621f3fe1633cff1ffcd917"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031247-814df0a/marvel-linux-arm64"
    sha256 "e705cc0d14ef414f193b4e81665c7ec534a415303168453ae0fc77274597a754"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-031247-814df0a/marvel-linux-amd64"
    sha256 "2fc3066480be85ecca4bb665aec7f8a242e67ab4cc204a77925a69db78a5d208"
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
