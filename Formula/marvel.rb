class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.221347.a038c18"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221347-a038c18/marvel-darwin-arm64"
    sha256 "8ae723c3b40631a88b3f4e86aba7a052cc15b2dbc19bf06b33aca4be4c29d3fa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221347-a038c18/marvel-darwin-amd64"
    sha256 "425eb9ae9bc3851822ec7225166a17dbb24f9e4cd3ea968dfbc715dbeae26a4e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221347-a038c18/marvel-linux-arm64"
    sha256 "ec986698294222281347507d709c83cf9f1d6179ad8690ada1ba8d7c5adb2bbc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221347-a038c18/marvel-linux-amd64"
    sha256 "85b7c73beea3ce652353cd4dd88315f3c536a7269ddd07d735b89386221407f1"
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
