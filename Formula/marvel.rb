class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.224925.a7017b0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-224925-a7017b0/marvel-darwin-arm64"
    sha256 "11ba6406a54057c74525d58b419cce0929b35501fd2f7095eada0be668ec514f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-224925-a7017b0/marvel-darwin-amd64"
    sha256 "2589e3e90fa3b3bd1dd3b4de9841b9a72216f40dd07300ff28758da21a330c8e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-224925-a7017b0/marvel-linux-arm64"
    sha256 "48247acce85f79ff77941a2320a1adc3b04d934e78f5791e04a839a168309f82"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-224925-a7017b0/marvel-linux-amd64"
    sha256 "f5832124f46e916b35a87cdce131603ad26c849557e5670e01818ebd8b38e985"
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
