class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260717.200613.c902260"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-200613-c902260/marvel-darwin-arm64"
    sha256 "f3301dd108b2b6ed7cf587257b41137bf55b32a98a7f6002af5478b3c31a778e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-200613-c902260/marvel-darwin-amd64"
    sha256 "efeedee0bd9feaa7b87eb107805e6cc5ebc3fa55504a721491eeb2bad0c6052b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-200613-c902260/marvel-linux-arm64"
    sha256 "92fa0dadfe2d674c27d9fd0414b2e2497c9d1e366190ee2f40ae961f3100a2e0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260717-200613-c902260/marvel-linux-amd64"
    sha256 "57377d42e65329bd63e283e4d8b110002d7bb48711eb1a4808b7a6b6c61e620c"
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
