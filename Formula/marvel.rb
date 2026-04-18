class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260418.001815.c48b017"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-001815-c48b017/marvel-darwin-arm64"
    sha256 "6fa030007bdc264add03b4336de87210b13876b09ab9f1b782cb95ee60ccb8e7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-001815-c48b017/marvel-darwin-amd64"
    sha256 "cb9a4a42cd48028eb7747414e87b9fafec246566d993296a8159b9334ac654ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-001815-c48b017/marvel-linux-arm64"
    sha256 "57421081fe60caf205f91f9fea93692dbee3134df7cfa7d6b0f3d0628e9d8513"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-001815-c48b017/marvel-linux-amd64"
    sha256 "abc09877fe24095807567b74f0b44c080162b4d619c6613762b46c1e5f934ec8"
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
