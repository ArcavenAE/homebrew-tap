class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.201941.2287ef3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201941-2287ef3/marvel-darwin-arm64"
    sha256 "cb82fca1178e6386d1cd7aac1ec8cf9c7a6871579821b665d3b9c0b763a56991"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201941-2287ef3/marvel-darwin-amd64"
    sha256 "8de78938c78067a253ce300dc2eb4e6dfcaed9d1f8949ce5f82e7deec7e34b4f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201941-2287ef3/marvel-linux-arm64"
    sha256 "bbc4b2d0f8e2bd4ddaac568fa2f6c392b719ac514edf58ab15b35341f7c94e0a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201941-2287ef3/marvel-linux-amd64"
    sha256 "71005b4aea672fefad18df2ec8979386962a3a5fab70c5aacfe4c784072951f4"
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
