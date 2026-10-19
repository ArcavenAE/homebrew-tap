class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.212723.5c48e09"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-212723-5c48e09/marvel-darwin-arm64"
    sha256 "2d1c87c0a28a23b0ccbdbba2b0e60ba46da85d3ea9d4bda8391a3fa5abe33e35"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-212723-5c48e09/marvel-darwin-amd64"
    sha256 "e187bee8af189d0c0666c1ab3e34c1e82ebbc570f7f026868ce0980ff82e1377"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-212723-5c48e09/marvel-linux-arm64"
    sha256 "7741f7a3cae9f1527f840b995a27558994bbab7bf2b310fa6574974cec57f344"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-212723-5c48e09/marvel-linux-amd64"
    sha256 "4861c7b2441140876387f917b3336c55f8c4793ecd4e3bd1bb2ea2394d92fba7"
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
