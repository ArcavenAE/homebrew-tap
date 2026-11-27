class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261127.193955.cb8cfaa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-193955-cb8cfaa/marvel-darwin-arm64"
    sha256 "acd9e6c01f3582eb1389427efd59d36096161a244971d73d102752592292bc8a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-193955-cb8cfaa/marvel-darwin-amd64"
    sha256 "3c1fd2858a3dfc04ceea0f6a032818739cfbdaea4103fec9fad457fcfd32d6c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-193955-cb8cfaa/marvel-linux-arm64"
    sha256 "cbc35d94683e10fb92c098e6e7d82a04a6c27fa20dcc194aec9cc2e4c90c3bb8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-193955-cb8cfaa/marvel-linux-amd64"
    sha256 "79a194a9e035ca2db39ecdf8ccea81ede22adf90a8bd9a09be00e0ee2079dcba"
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
