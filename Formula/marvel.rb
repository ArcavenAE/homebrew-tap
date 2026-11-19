class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.215959.554036c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-215959-554036c/marvel-darwin-arm64"
    sha256 "a9632456afaa5f7aada4e99fa26ade1a0867ded4eafc0e306084462becfe06a9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-215959-554036c/marvel-darwin-amd64"
    sha256 "1a2449e0162c6286f0953ade2e201d7cda8ec4d15ba18624b86571fb6c8c7c96"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-215959-554036c/marvel-linux-arm64"
    sha256 "ef5933f26eb3b9ed040968bbadc332f172f8b4bc38d0372cb2bcb7a9d9dd5f40"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-215959-554036c/marvel-linux-amd64"
    sha256 "4ce26c4b5a3533c5ff616c45d47e7fd60496d7ed915db13186ed0cdda66b831b"
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
