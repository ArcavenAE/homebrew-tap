class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260918.013827.d2a16d2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013827-d2a16d2/marvel-darwin-arm64"
    sha256 "d5df4a629f7a5848196c8dbc8232fea597a384d676462920ea11fff4cea23905"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013827-d2a16d2/marvel-darwin-amd64"
    sha256 "906370340474110118adb2c1a945b8f6faa0cb0f2c397b36b03f613f1760098b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013827-d2a16d2/marvel-linux-arm64"
    sha256 "aae0e413383c3873d64d907026fafbd50aa2b39138f109a24b9b7b403433827a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-013827-d2a16d2/marvel-linux-amd64"
    sha256 "29fd5e7386c57287bdf800f48283521468076a108911c7485d7bc071a6363be6"
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
