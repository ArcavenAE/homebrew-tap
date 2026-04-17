class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.021249.718e8b6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-021249-718e8b6/marvel-darwin-arm64"
    sha256 "34cf54b15dd08d05533e0996575a17247828f328760f915fc7b4f10d580c152a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-021249-718e8b6/marvel-darwin-amd64"
    sha256 "5c440368ad9327aaf818de5b148e18fedef83e94dccbf9c3927c185b4c47a284"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-021249-718e8b6/marvel-linux-arm64"
    sha256 "d4e6586ea77642a176d9788859485102341a3bb3599c251a89631543b407abc5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-021249-718e8b6/marvel-linux-amd64"
    sha256 "4065ad53c9c40e844e3a01eff48665a339a3c7a8ad44c3545e35de0848f2bf29"
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
