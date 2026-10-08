class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.145007.930c286"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-145007-930c286/marvel-darwin-arm64"
    sha256 "5a61f333298cef474f470e08c2b9ab3776e38649172523ed46503ca6be4144fc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-145007-930c286/marvel-darwin-amd64"
    sha256 "b6e59cb1ee902115f96330bcbde7ab9dbac76f8288a8ab084d1ecf0b7e88f9d4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-145007-930c286/marvel-linux-arm64"
    sha256 "da8c8774935727102e9b505820b21a0633fc3261d06790ffd87d180213f6b632"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-145007-930c286/marvel-linux-amd64"
    sha256 "331946664144e39914aba92607f9eee03bd00cde5e434728eef815d991920354"
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
