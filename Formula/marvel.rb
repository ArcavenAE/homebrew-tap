class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.190431.2bd4cc9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-190431-2bd4cc9/marvel-darwin-arm64"
    sha256 "2366d3ef8dce5f0071a2525a345a1559bbf5f2c5adde900c15989a40aa689879"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-190431-2bd4cc9/marvel-darwin-amd64"
    sha256 "0304508d319a536d36fc92ae2efc1ada8505a1139fd2c0289da45dd80f8df0b4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-190431-2bd4cc9/marvel-linux-arm64"
    sha256 "048b175187b064b2559754762563c63bf1b468d02816c20c0385e868f79f7200"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-190431-2bd4cc9/marvel-linux-amd64"
    sha256 "c799eeea38113cd4cc138fd1b7f4302de50303e703514e6824a90abe7472d9b5"
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
