class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.195108.287fd7b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-195108-287fd7b/marvel-darwin-arm64"
    sha256 "1c3b7720bb205d66824fdb7a1d8f6c3004dca064a153f39a45cd26f489fa1b2b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-195108-287fd7b/marvel-darwin-amd64"
    sha256 "3efeec2f6eed01a74da7287c3572afd76bd838928291ac6c0477ebe478866e03"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-195108-287fd7b/marvel-linux-arm64"
    sha256 "c411f194b3046e26f75554b2607d4eaa1a3a342994befe50a96bdc56e119b7dd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-195108-287fd7b/marvel-linux-amd64"
    sha256 "068bd7b7a76e5ce340a642e55c9a8e0649a54c20bcef863ad5cc12f3f5b78092"
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
