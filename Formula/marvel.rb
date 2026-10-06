class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.143438.7651cc4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-143438-7651cc4/marvel-darwin-arm64"
    sha256 "3b70757e267f89accc98ac41494153bfd30191e737f59f82b45025b4554a63c1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-143438-7651cc4/marvel-darwin-amd64"
    sha256 "61dfc52fb99fda67bb74d0d7d976d72add70d756bf855d929f9678825e0f8b5f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-143438-7651cc4/marvel-linux-arm64"
    sha256 "e84925330ad327692ac3a1bfb08051c8d18ae5773d43af9577c71692b0058a5f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-143438-7651cc4/marvel-linux-amd64"
    sha256 "7dd737ba6f3113e1754eda0b6d206981b31c0edbf3c2daa000d5c01531d2cf9b"
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
