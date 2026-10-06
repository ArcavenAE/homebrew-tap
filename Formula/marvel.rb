class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.212007.fc06c8f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212007-fc06c8f/marvel-darwin-arm64"
    sha256 "6ac9ff1f4131abae8462a2f9c66f69d504e09ddcd6970a173133dade0fbe35c5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212007-fc06c8f/marvel-darwin-amd64"
    sha256 "a52a31c499d70b465fa3632912673abc01749c8c30c571e5d5d9ac4a81b261b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212007-fc06c8f/marvel-linux-arm64"
    sha256 "14378a2069b5cfa3366c79f444ab8fc83c1413a3633423493f70ae9bf06e4896"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-212007-fc06c8f/marvel-linux-amd64"
    sha256 "edc2b3e3ffa47ec8ecbe1a4d171f66350280271828a35601d137951d2230e9a0"
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
