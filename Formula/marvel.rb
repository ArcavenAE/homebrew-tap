class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.034358.ed56d32"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-034358-ed56d32/marvel-darwin-arm64"
    sha256 "ec2da99bb26b47910daafbbbc48cf0feba1a93b780f4bc31fcd6cf67eb8e6b99"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-034358-ed56d32/marvel-darwin-amd64"
    sha256 "058286153429016c98b1e74591242a1cc8f6b04b099546b525752b866d704503"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-034358-ed56d32/marvel-linux-arm64"
    sha256 "f1b608fcf3e9bfddd68b3b732b7e115d6d21cb1af5d7899e314f4391b46cef43"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-034358-ed56d32/marvel-linux-amd64"
    sha256 "0ca8a5f8fcdae9a17364f762a35eb0472ccdf0ac1d84834b196f9333a72bc918"
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
