class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.062333.c33e9cc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062333-c33e9cc/marvel-darwin-arm64"
    sha256 "b1ebd83f921cb709d6983868444b0058958bbeed7355e253622128ff9a30c864"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062333-c33e9cc/marvel-darwin-amd64"
    sha256 "757268b864da1155b61b0e7479d8ef8a967796e81122a5e8ba0008dda663dbcf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062333-c33e9cc/marvel-linux-arm64"
    sha256 "553ee6f615ae8e433754f7f921af237e8ec6b3fe50d025fd15a4a3fb036ab5dd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-062333-c33e9cc/marvel-linux-amd64"
    sha256 "d232405a9fe102dacfa677e77c51d6a21bc9d5bf823643bd553540cd6a77ec28"
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
