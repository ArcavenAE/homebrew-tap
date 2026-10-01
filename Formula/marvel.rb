class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261001.120013.0b07145"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-120013-0b07145/marvel-darwin-arm64"
    sha256 "626454483331b27ae12d11532be11b4ee25ef4f2d0428c66c21c942abdb36632"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-120013-0b07145/marvel-darwin-amd64"
    sha256 "00521822f4328ff82f98bb608d80b2f35cad3626c44609c30918001df2f01186"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-120013-0b07145/marvel-linux-arm64"
    sha256 "95778b6f1c58ebdc8295853e4873384cc4c2fbab016cb46a511898fb9aef151c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261001-120013-0b07145/marvel-linux-amd64"
    sha256 "edd25fc5c31f1f9bf8795b1dc8b105014e024051ac30661e86927025e276820f"
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
