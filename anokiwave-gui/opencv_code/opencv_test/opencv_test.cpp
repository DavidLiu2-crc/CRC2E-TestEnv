
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace cv;
using namespace std;


int main(int argc, char* argv[]) {
	// Image relative path string
	char* pathImage = argv[1];
	char pathOutput[32] = "CW";

	// Create cv image
	Mat src = imread(argv[1], 1);
	//Mat src = imread("ladybug_Rectified_Cam0.jpg", 1);
	Mat dst;
	rotate(src, dst, cv::ROTATE_90_CLOCKWISE);

	strcat_s(pathOutput, pathImage);
	imwrite(pathOutput, dst);

	return 0;
}
