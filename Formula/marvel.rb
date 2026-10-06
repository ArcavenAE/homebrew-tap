class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.173425.5ade5f9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-173425-5ade5f9/marvel-darwin-arm64"
    sha256 "4ca2a871319a3e33b4150ad769ed3586b697e574aae8a37257894ab69974fa31"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-173425-5ade5f9/marvel-darwin-amd64"
    sha256 "824f5d3d06a248c8a2aad0a697c5ce62a5c470acf84e68e81c9f320c73d21ba4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-173425-5ade5f9/marvel-linux-arm64"
    sha256 "1a0fe746500a59416d0fef09158283b14c089a551299a75946db1ccdccbdf87f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-173425-5ade5f9/marvel-linux-amd64"
    sha256 "1532aaca471dffc56038bc2f4da9417fea3cb8c3d79d721503c4ef8f48a406d6"
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
